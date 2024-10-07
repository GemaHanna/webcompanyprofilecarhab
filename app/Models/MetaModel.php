<?php

namespace App\Models;

use CodeIgniter\Model;

class MetaModel extends Model
{
    protected $table = 'tb_meta'; // Nama tabel
    protected $primaryKey = 'id_seo'; // Primary key
    protected $allowedFields = ['nama_halaman', 'meta_title', 'meta_description', 'canonical_url']; // Kolom yang bisa diisi

    // Optional: Jika kamu ingin menggunakan timestamp
    protected $useTimestamps = false; // Set true jika ingin menggunakan created_at dan updated_at

    // Jika perlu, bisa menambahkan rules untuk validasi
    protected $validationRules = [
        'nama_halaman' => 'required',
        'meta_title' => 'required',
        'meta_description' => 'required',
        'canonical_url' => 'max_length[255]',
    ];

    protected $validationMessages = [
        // Tambahkan pesan kustom jika perlu
    ];

    protected $skipValidation = false; // Set true jika tidak ingin validasi dilakukan
}
