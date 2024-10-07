<!DOCTYPE html>
<html>
<head>
    <title>Edit Meta</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-4">Edit Meta</h1>
        <form action="<?= base_url('admin/meta/update/' . $meta['id_seo']) ?>" method="post">
            <?= csrf_field() ?>
            <div class="form-group">
                <label for="nama_halaman">Nama Halaman:</label>
                <input type="text" class="form-control" id="nama_halaman" name="nama_halaman" value="<?= old('nama_halaman', $meta['nama_halaman']) ?>">
                <?php if (isset($errors['nama_halaman'])): ?>
                    <div class="text-danger"><?= $errors['nama_halaman'] ?></div>
                <?php endif; ?>
            </div>
            
            <div class="form-group">
                <label for="meta_title">Meta Title:</label>
                <input type="text" class="form-control" id="meta_title" name="meta_title" value="<?= old('meta_title', $meta['meta_title']) ?>">
                <?php if (isset($errors['meta_title'])): ?>
                    <div class="text-danger"><?= $errors['meta_title'] ?></div>
                <?php endif; ?>
            </div>
            
            <div class="form-group">
                <label for="meta_description">Meta Description:</label>
                <input type="text" class="form-control" id="meta_description" name="meta_description" value="<?= old('meta_description', $meta['meta_description']) ?>">
                <?php if (isset($errors['meta_description'])): ?>
                    <div class="text-danger"><?= $errors['meta_description'] ?></div>
                <?php endif; ?>
            </div>
            
            <div class="form-group">
                <label for="canonical_url">Canonical URL:</label>
                <input type="text" class="form-control" id="canonical_url" name="canonical_url" value="<?= old('canonical_url', $meta['canonical_url']) ?>">
                <?php if (isset($errors['canonical_url'])): ?>
                    <div class="text-danger"><?= $errors['canonical_url'] ?></div>
                <?php endif; ?>
            </div>
            
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</body>
</html>
