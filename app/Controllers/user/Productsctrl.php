<?php

namespace App\Controllers\user;

use App\Controllers\user\BaseController;
use App\Models\MetaModel;
use App\Models\ProfilModel;
use App\Models\SliderModel;
use App\Models\ProdukModel;

class Productsctrl extends BaseController
{
    private $ProfilModel;
    private $SliderModel;
    private $ProdukModel;
    private $MetaModel;

    public function __construct()
    {
        $this->ProfilModel = new ProfilModel();
        $this->SliderModel = new SliderModel();
        $this->ProdukModel = new ProdukModel();
        $this->MetaModel = new MetaModel();
    }

    public function index()
    {
        $meta = $this->MetaModel->where('nama_halaman', 'Produk')->first();
        $canonicalUrl = base_url('/product');
        
        $data = [
            'profil' => $this->ProfilModel->findAll(),
            'tbslider' => $this->SliderModel->findAll(),
            'tbproduk' => $this->ProdukModel->findAll(),
            'meta' => $meta,
            'canonicalUrl' => $canonicalUrl,
        ];

        helper('text');

        // Tentukan bahasa yang sedang aktif
        $lang = session('lang') ?? 'in'; // Default ke 'in' jika tidak ada session
        
        $nama_perusahaan = $data['profil'][0]->nama_perusahaan;
        if ($lang === 'in') {
            $deskripsi_perusahaan = strip_tags($data['profil'][0]->deskripsi_perusahaan_in);
            $data['Title'] = "Produk dari $nama_perusahaan";
        } else {
            $deskripsi_perusahaan = strip_tags($data['profil'][0]->deskripsi_perusahaan_en);
            $data['Title'] = "Products of $nama_perusahaan";
        }

        // Batasi deskripsi meta hingga 150 karakter
        $teks = "$data[Title]. $deskripsi_perusahaan";
        $batasan = 150;
        $data['Meta'] = character_limiter($teks, $batasan);

        return view('user/products/index', $data);
    }

    public function detailBySlug($slug)
    {
        // Cari produk berdasarkan slug (slug_en atau slug_in)
        $produk = $this->ProdukModel
                       ->where('slug_en', $slug)
                       ->orWhere('slug_in', $slug)
                       ->first();

        // Jika produk tidak ditemukan, lemparkan error 404
        if (!$produk) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('Produk tidak ditemukan');
        }

        $data = [
            'profil' => $this->ProfilModel->findAll(),
            'tbproduk' => $produk,
        ];

        helper('text');

        // Tentukan bahasa yang sedang aktif
        $lang = session('lang') ?? 'in';
        
        if ($lang === 'in') {
            $nama_produk = $produk->nama_produk_in;
            $deskripsi_produk = strip_tags($produk->deskripsi_produk_in);
        } else {
            $nama_produk = $produk->nama_produk_en;
            $deskripsi_produk = strip_tags($produk->deskripsi_produk_en);
        }

        // Set Title dan Meta Description
        $data['Title'] = $nama_produk;
        $teks = "$nama_produk. $deskripsi_produk";
        $batasan = 150;
        $data['Meta'] = character_limiter($teks, $batasan);

        return view('user/products/detail', $data);
    }
}

