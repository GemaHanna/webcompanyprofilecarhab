<?php

namespace App\Controllers\user;

use App\Controllers\user\BaseController;
use App\Models\ProfilModel;
use App\Models\SliderModel;
use App\Models\ProdukModel;
use App\Models\MetaModel;

class Aboutctrl extends BaseController
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
        // SEO
    $metaModel = new MetaModel();
    $meta = $metaModel->where('nama_halaman', 'Tentang')->first();
    
    $canonicalUrl = base_url('/tentang');

        $data = [
            'profil' => $this->ProfilModel->findAll(),
            'tbslider' => $this->SliderModel->findAll(),
            'tbproduk' => $this->ProdukModel->findAll(),
            'meta' => $meta,
            'canonicalUrl' => $canonicalUrl,
        ];

        $data['Title'] = $data['profil'][0]->title_website;

        helper('text');

        if (session('lang') === 'in') {
            $teks = strip_tags($data['profil'][0]->deskripsi_perusahaan_in);
        } else {
            $teks = strip_tags($data['profil'][0]->deskripsi_perusahaan_en);
        }

        $batasan = 150;
        $data['Meta'] = character_limiter($teks, $batasan);

        // Meta title and description
        $data['metaTitle'] = $data['Title'] ?? 'High-Quality Clove Export | PT NAKAM Foods Indonesia';
        $data['metaDesc'] = $data['Meta'] ?? 'PT NAKAM Foods Indonesia specializes in exporting premium-quality Indonesian cloves. We ensure efficient logistics and on-time delivery for international markets.';

        // Canonical URL
        $data['canonical'] = base_url('high-quality-clove-exporter');

        return view('user/about/index', $data);
    }
}
