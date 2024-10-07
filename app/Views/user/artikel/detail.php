<?= $this->extend('user/template/template') ?>
<?= $this->Section('content'); ?>

<?php
$lang = session('lang') ?? 'in'; // Definisikan variabel $lang
?>

<style>
    .article-title {
        white-space: normal;
        word-wrap: break-word;
        overflow-wrap: break-word;
        width: 100%;
    }

    .article-item {
        display: flex;
        height: 110px;
        /* Tinggi card sesuai dengan tinggi gambar */
        overflow: hidden;
        /* Sembunyikan overflow */
    }

    .article-image {
        width: 110px;
        height: 110px;
        object-fit: cover;
    }

    .article-content {
        display: flex;
        flex-direction: column;
        justify-content: center;
        flex: 1;
        padding: 0 1rem;
        white-space: normal;
        /* Izinkan teks membungkus ke baris berikutnya */
        overflow: hidden;
        /* Sembunyikan overflow yang tidak perlu */
        text-overflow: ellipsis;
        /* Tambahkan ellipsis pada teks yang terlalu panjang */
    }
</style>

<div class="container-fluid page-header py-5" style="background-image: url('<?= base_url('./asset-user/images/hero_1.jpg'); ?>');"></div>

<!-- News With Sidebar Start -->
<div class="container-fluid pt-5 mb-3">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <!-- News Detail Start -->
                <div class="position-relative mb-3">
                    <img class="img-fluid w-100" src="<?= base_url('asset-user/images/' . $artikel->foto_artikel); ?>" style="object-fit: cover;">
                    <div class="bg-white border border-top-0 p-4">
                        <div class="mb-3">
                            <a class="text-uppercase mb-3 text-body"><?= date('d F Y', strtotime($artikel->created_at)); ?></a>
                        </div>
                        <h1 class="display-5 mb-2 article-title">
                            <?= ($lang == 'en') ? esc($artikel->judul_artikel_en ?? 'Judul tidak tersedia') : esc($artikel->judul_artikel_in ?? 'Judul tidak tersedia'); ?>
                        </h1>
                        <p class="fs-5"><?= $artikel->deskripsi_artikel; ?></p>
                    </div>
                </div>
                <!-- News Detail End -->
            </div>

            <div class="col-lg-4">
                <!-- Popular News Start -->
                <div class="mb-3">
                    <div class="row">
                        <div class="mb-5">
                            <img src="<?= base_url('asset-user/images/news.png') ?>" alt="Logo" style="width: 50px; height: auto; text-align: left;">
                        </div>
                        <br>
                        <div class="bg-white border border-top-0 p-3">
                            <?php foreach ($artikel_lain as $artikel_item) : ?>
                                <div class="d-flex align-items-center bg-white mb-3 article-item">
                                    <a href="<?= base_url($lang . '/' . ($lang === 'en' ? 'article' : 'artikel') . '/' . ($lang === 'en' ? $artikel_item->slug_en : $artikel_item->slug_in)); ?>">
                                        <img class="img-fluid article-image" src="<?= base_url('asset-user/images/' . $artikel_item->foto_artikel); ?>" alt="Gambar utama untuk artikel <?= esc($lang == 'en' ? $artikel_item->judul_artikel_en : $artikel_item->judul_artikel_in); ?>" loading="lazy">
                                    </a>
                                    <div class="w-100 h-100 d-flex flex-column justify-content-center border border-left-0 article-content">
                                        <div class="mb-2">
                                            <a class="text-body" href="<?= base_url($lang . '/' . ($lang === 'en' ? 'article' : 'artikel') . '/' . ($lang === 'en' ? $artikel_item->slug_en : $artikel_item->slug_in)); ?>">
                                                <small><?= date('d F Y', strtotime($artikel_item->created_at)); ?></small>
                                            </a>
                                        </div>
                                        <a class="h6 m-0 display-7" href="<?= base_url($lang . '/' . ($lang === 'en' ? 'article' : 'artikel') . '/' . ($lang === 'en' ? $artikel_item->slug_en : $artikel_item->slug_in)); ?>">
                                            <?= ($lang == 'en') ? esc($artikel_item->judul_artikel_en) : esc($artikel_item->judul_artikel_in); ?>...
                                        </a>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <!-- Popular News End -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- News With Sidebar End -->

<?= $this->endSection('content'); ?>