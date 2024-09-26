document.getElementById('znacenjeButton').addEventListener('click', function () {
    const modal = new bootstrap.Modal(document.getElementById('znacenjeModal'));
    modal.show();
});

document.getElementById('primeriButton').addEventListener('click', function () {
    const modal = new bootstrap.Modal(document.getElementById('primeriModal'));
    modal.show();
});

document.getElementById('izraziButton').addEventListener('click', function () {
    const modal = new bootstrap.Modal(document.getElementById('izraziModal'));
    modal.show();
});
