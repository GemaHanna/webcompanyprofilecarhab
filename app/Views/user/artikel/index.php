<?= $this->extend('user/template/template') ?>
<?= $this->Section('content'); ?>

<?php
$lang = session('lang') ?? 'in' ; // Definisikan variabel $lang
?>

<div class="intro-section mb-5 position-relative overlay-bottom">
    <div class="d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5" style="min-height: 400px; background-image: url('<?= base_url('asset-user/images/hero_1.jpg'); ?>'); background-size: cover;">
        <h1 class="display-4 mb-3 mt-0 mt-lg-5 text-white text-uppercase">
            <?php foreach ($profil as $perusahaan) : ?>
                <?php
                echo lang('Blog.titleOurarticle');
                if (!empty($perusahaan)) {
                    echo ' ' . $perusahaan->nama_perusahaan;
                }
                ?>
            <?php endforeach; ?>
        </h1>
        <!-- <div class="d-inline-flex mb-lg-5">
                <p class="m-0 text-white"><a class="text-white" href="<?= base_url('/') ?>"><?php echo lang('Blog.headerHome'); ?></a></p>
                <p class="m-0 text-white px-2">/</p>
                <p class="m-0 text-white"><?php echo lang('Blog.headerProducts'); ?></p>
            </div> -->
    </div>
</div>

<!-- News With Sidebar Start -->
<div class="container-fluid mt-5 pt-3">
    <div class="container">
        <div class="row">
            <!-- <div class="mb-5">
                <h5 class="mb-2 px-3 py-1 text-dark rounded-pill d-inline-block border border-2 border-primary" style="text-align: left;">Artikel Terbaru</h5>
            </div> -->
            <div class="mb-5">
                <img src="<?= base_url('asset-user/images/news.png') ?>" alt="Logo Berita" style="width: 50px; height: auto; text-align: left;">
            </div>
        </div>
        <br>
        <br>
        <div class="row">
            <?php foreach ($artikelterbaru as $row) : ?>
                <div class="col-lg-4 mb-4">
                    <div class="article-card position-relative d-flex flex-column h-100 mb-3">
                        <a href="<?= base_url($lang . '/' . ($lang === 'en' ? 'article' : 'artikel') . '/' . ($lang === 'en' ? $row->slug_en : $row->slug_in)); ?>" class="article-card-link">
                        <img class="img-fluid w-100" style="object-fit: cover;" src="<?= base_url('asset-user') ?>/images/<?= $row->foto_artikel; ?>" alt="Gambar utama untuk artikel <?= esc($lang == 'en' ? $row->judul_artikel_en : $row->judul_artikel_in); ?>" loading="lazy">
                        </a>
                        <div class="bg-white border border-top-0 p-4 flex-grow-1">
                            <div class="mb-2">
                                <a class="read-more-link" href="<?= base_url($lang . '/' . ($lang === 'en' ? 'article' : 'artikel') . '/' . ($lang === 'en' ? $row->slug_en : $row->slug_in)); ?>">
                                    <?= esc(($lang == 'en') ? $row->judul_artikel_en : $row->judul_artikel_in); ?> <!-- Menampilkan judul artikel -->
                                </a>
                            </div>
                            <p><?= substr(strip_tags($row->deskripsi_artikel), 0, 30) ?>...</p>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>

<style>
    .intro-section h1 {
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Adjust the shadow parameters as needed */
    }

    .article-card {
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .article-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }
</style>

<?= $this->endSection('content'); ?>