<!-- MODAL TRIGER -->
<section>
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
    <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasRightLabel">Edit Profil</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body w-100">

    <div class="mb-3 row">
        <label for="staticEmail" class="col-sm-3 col-form-label">Nama:</label>
        <div class="col-sm-9">
            <a type="text" readonly class="form-control-plaintext" id="staticEmail" style="text-decoration: none;">${sessionScope.user.first_name}</a>
        </div>

        <label for="staticEmail" class="col-sm-3 col-form-label">Email:</label>
        <div class="col-sm-9">
            <a type="text" readonly class="form-control-plaintext" id="staticEmail" style="text-decoration: none;">${sessionScope.user.email}</a>
        </div>

        <label for="staticEmail" class="col-sm-3 col-form-label">Password:</label>
        <div class="col-sm-9">
        <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-toggle="modal" data-bs-target="#reset-PasswordDikaosan">Ubah Sandi</button>
        </div>

        <div class="history d-flex flex-column justify-content-center align-items-center my-2">
        <button type="button" class="btn btn-primary confirm_btn_success w-50" data-bs-toggle="modal" data-bs-target="#historyPembelian">History Pembelian</button>
        <button type="button" class="btn btn-primary confirm_btn_success w-50 my-2" data-bs-toggle="modal" data-bs-target="#LogOut">Logout</button>
        </div>
    </div>

    </div>
</div>
</section>

    