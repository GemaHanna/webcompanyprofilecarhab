<?php

namespace App\Controllers\admin;

use App\Models\ArtikelModel;

class Artikel extends BaseController
{
    private $artikelModel;

    public function __construct()
    {
        $this->artikelModel = new ArtikelModel();
    }

    
    public function generateSlug($string)
    {
        // Ubah string menjadi huruf kecil
        $slug = strtolower($string);
        // Hapus semua karakter non-alfanumerik kecuali spasi
        $slug = preg_replace('/[^a-z0-9\s]/', '', $slug);
        // Ganti spasi dengan tanda hubung
        $slug = preg_replace('/\s+/', '-', $slug);
        
    return $slug;
    }
    
    public function index()
    {
        // Pengecekan apakah pengguna sudah login atau belum
        if (!session()->get('logged_in')) {
            return redirect()->to(base_url('login')); // Sesuaikan dengan halaman login Anda
        }

        $data = [
            'artikels' => $this->artikelModel->findAll(),
        ];

        return view('admin/artikel/index', $data);
    }

    public function tambah()
    {
        // Pengecekan apakah pengguna sudah login atau belum
        if (!session()->get('logged_in')) {
            return redirect()->to(base_url('login')); // Sesuaikan dengan halaman login Anda
        }

        return view('admin/artikel/tambah', [
            'validation' => $this->validator
        ]);
    }

    public function proses_tambah()
   {
    // Pengecekan apakah pengguna sudah login atau belum
    if (!session()->get('logged_in')) {
        return redirect()->to(base_url('login')); // Sesuaikan dengan halaman login Anda
    }

    // Ambil data dari input form
    $nama_artikel_in = $this->request->getPost('judul_artikel_in');
    $nama_artikel_en = $this->request->getPost('judul_artikel_en');

    $slug_in = $this->generateSlug($nama_artikel_in);  
    $slug_en = $this->generateSlug($nama_artikel_en);
    // Proses validasi input disini
    if (!$this->validate([
        'judul_artikel_in' => 'required',
        'judul_artikel_en' => 'required',
        'foto_artikel' => [
            'rules' => 'uploaded[foto_artikel]|is_image[foto_artikel]|max_dims[foto_artikel,572,572]|mime_in[foto_artikel,image/jpg,image/jpeg,image/png]',
            'errors' => [
                'uploaded' => 'Pilih foto terlebih dahulu',
                'is_image' => 'File yang anda pilih bukan gambar',
                'max_dims' => 'Maksimal ukuran gambar 572x572 pixels',
                'mime_in' => 'File yang anda pilih wajib berekstensikan jpg/jpeg/png',
            ]
        ]
    ])) {
        // Jika validasi gagal, kembalikan ke form dengan pesan error
        session()->setFlashdata('error', $this->validator->listErrors());
        return redirect()->back()->withInput();
    }

    // Validasi berhasil, lanjutkan penyimpanan data
    $file_foto = $this->request->getFile('foto_artikel');
    $currentDateTime = date('dmYHis'); // Membuat nama file unik
    $newFileName = "{$currentDateTime}.{$file_foto->getExtension()}"; // Menyimpan nama file berdasarkan timestamp
    $file_foto->move('asset-user/images', $newFileName); // Pindahkan file ke folder yang dituju

    // Siapkan data untuk disimpan ke database
    $data = [
        'judul_artikel_in' => $nama_artikel_in,
        'judul_artikel_en' => $nama_artikel_en,
        'deskripsi_artikel' => $this->request->getPost('deskripsi_artikel'),
        'foto_artikel' => $newFileName,
        'slug_in' => $slug_in,
        'slug_en' => $slug_en,
        // Tambahkan field lain sesuai kebutuhan
    ];

    // Simpan artikel ke dalam database
    $this->artikelModel->insert($data);

    // Redirect ke halaman admin artikel setelah data tersimpan
    return redirect()->to(base_url('admin/artikel'))->with('success', 'Artikel berhasil ditambahkan');
}

    public function edit($id_artikel)
    {
        // Pengecekan apakah pengguna sudah login atau belum
        if (!session()->get('logged_in')) {
            return redirect()->to(base_url('login')); // Ubah 'login' sesuai dengan halaman login kamu
        }
        $artikel_model = new ArtikelModel();
        $artikelData = $artikel_model->find($id_artikel);
        $validation = \Config\Services::validation();

        return view('admin/artikel/edit', [
            'artikelData' => $artikelData,
            'validation' => $validation
        ]);
    }

    public function proses_edit($id_artikel = null)
    {
        // Pengecekan apakah pengguna sudah login atau belum
        if (!session()->get('logged_in')) {
            return redirect()->to(base_url('login')); // Sesuaikan dengan halaman login Anda
        }

        // Pengecekan apakah ID artikel valid
        if (!$id_artikel) {
            return redirect()->back();
        }

        // Validasi input
        if (!$this->validate([
            'judul_artikel_in' => 'required|max_length[255]',
            'judul_artikel_en' => 'required|max_length[255]',
            'deskripsi_artikel' => 'required',
            'meta_title' => 'required', // Tambahkan validasi untuk meta_title
            'meta_description' => 'required', // Tambahkan validasi untuk meta_description
        ])) {
            return redirect()->back()->withInput()->with('errors', $this->validator->getErrors());
        }

        // Ambil data dari input form
        $nama_artikel_in = $this->request->getPost('judul_artikel_in');
        $nama_artikel_en = $this->request->getPost('judul_artikel_en');

        $slug_in = $this->generateSlug($nama_artikel_in);  
        $slug_en = $this->generateSlug($nama_artikel_en);

        $file_foto = $this->request->getFile('foto_artikel');

        // Jika file foto di-upload
        if ($file_foto->isValid()) {
            // Hapus foto lama jika ada
            $artikelData = $this->artikelModel->find($id_artikel);
            $oldFilePath = 'asset-user/images/' . $artikelData->foto_artikel;
            if (file_exists($oldFilePath)) {
                unlink($oldFilePath);
            }

            // Simpan foto baru
            $newFileName = $file_foto->getRandomName();
            $file_foto->move('asset-user/images', $newFileName);
        } else {
            // Jika tidak ada file foto baru, gunakan foto lama
            $artikelData = $this->artikelModel->find($id_artikel);
            $newFileName = $artikelData->foto_artikel;
        }

        // Update data artikel
        $data = [
            'judul_artikel_in' => $this->request->getPost('judul_artikel_in'), // Perbaikan field
            'judul_artikel_en' => $this->request->getPost('judul_artikel_en'), // Perbaikan field
            'deskripsi_artikel' => $this->request->getPost('deskripsi_artikel'),
            'foto_artikel' => $newFileName,
            'slug_in' => $slug_in,
            'slug_en' => $slug_en,
            'meta_title' => $this->request->getPost('meta_title'),
            'meta_description' => $this->request->getPost('meta_description'),
        ];
        

        // Update data artikel dalam database
        $this->artikelModel->update($id_artikel, $data);

        // Redirect ke halaman admin artikel
        return redirect()->to(base_url('admin/artikel/index'));
    }

    public function delete($id = false)
    {
        // Pengecekan apakah pengguna sudah login atau belum
        if (!session()->get('logged_in')) {
            return redirect()->to(base_url('login')); // Ubah 'login' sesuai dengan halaman login kamu
        }
        $artikelModel = new ArtikelModel();

        $data = $artikelModel->find($id);

        unlink('asset-user/images/' . $data->foto_artikel);

        $artikelModel->delete($id);

        return redirect()->to(base_url('admin/artikel/index'));
    }
}
