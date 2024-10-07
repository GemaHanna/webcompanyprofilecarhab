<?php

namespace App\Controllers\user;

use App\Controllers\user\BaseController;
use App\Models\ProfilModel;
use App\Models\SliderModel;
use App\Models\ProdukModel;
use App\Models\AktivitasModel;
use App\Models\MetaModel;

class Aktivitasctrl extends BaseController
{
    private $ProfilModel;
    private $SliderModel;
    private $ProdukModel;
    private $AktivitasModel;
    private $MetaModel;


    public function __construct()
    {
        $this->ProfilModel = new ProfilModel();
        $this->SliderModel = new SliderModel();
        $this->ProdukModel = new ProdukModel();
        $this->AktivitasModel = new AktivitasModel();
        $this->MetaModel = new MetaModel();
        helper('text'); // Panggil helper sekali saja
    }

    public function index()
    {
        // SEO
        $metaModel = new MetaModel();
        $meta = $metaModel->where('nama_halaman', 'Aktivitas')->first();
    
        $canonicalUrl = base_url('/aktivitas');
        $data = [
            'profil' => $this->ProfilModel->findAll(),
            'tbslider' => $this->SliderModel->findAll(),
            'tbproduk' => $this->ProdukModel->findAll(),
            'tbaktivitas' => $this->AktivitasModel->findAll(),
            'meta' => $meta,
            'canonicalUrl' => $canonicalUrl,
        ];

        // Tentukan bahasa yang sedang aktif
        $lang = session('lang') ?? 'in';

        // Judul dan deskripsi aktivitas
        $nama_perusahaan = $data['profil'][0]->nama_perusahaan;
        if ($lang === 'in') {
            $deskripsi_perusahaan = strip_tags($data['profil'][0]->deskripsi_perusahaan_in);
            $data['Title'] = "Aktivitas dari $nama_perusahaan";
        } else {
            $deskripsi_perusahaan = strip_tags($data['profil'][0]->deskripsi_perusahaan_en);
            $data['Title'] = "Activities of $nama_perusahaan";
        }

        // Set meta deskripsi
        $teks = "$data[Title]. $deskripsi_perusahaan";
        $data['Meta'] = character_limiter($teks, 150);

        return view('user/aktivitas/index', $data);
    }

    public function detailBySlug($slug)
    {
        // Cari aktivitas berdasarkan slug (slug_en atau slug_in)
        $aktivitas = $this->AktivitasModel
                          ->where('slug_en', $slug)
                          ->orWhere('slug_in', $slug)
                          ->first();

        // Jika aktivitas tidak ditemukan, lemparkan error 404
        if (!$aktivitas) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Aktivitas tidak ditemukan');
        }

        $data = [
            'profil' => $this->ProfilModel->findAll(), // Perbaikan pengambilan profil
            'tbaktivitas' => $aktivitas,
        ];

        // Tentukan bahasa yang sedang aktif
        $lang = session('lang');

        // Set nama dan deskripsi aktivitas berdasarkan bahasa
        $nama_aktivitas = ($lang === 'in') ? $aktivitas->nama_aktivitas_in : $aktivitas->nama_aktivitas_en;
        $deskripsi_aktivitas = strip_tags(($lang === 'in') ? $aktivitas->deskripsi_aktivitas_in : $aktivitas->deskripsi_aktivitas_en);

        // Set Title dan Meta Description
        $data['Title'] = $nama_aktivitas;
        $data['Meta'] = character_limiter("$nama_aktivitas. $deskripsi_aktivitas", 150);

        return view('user/aktivitas/detail', $data);
    }
}
