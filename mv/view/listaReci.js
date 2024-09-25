const pretraga = globals.debounce(
    ()=>document.querySelector('#searchForm').submit(),
    500
)

document.addEventListener('DOMContentLoaded', function() {
    const leksemaInput = document.querySelector('#leksema');
    leksemaInput.focus();
    leksemaInput.setSelectionRange(leksemaInput.value.length, leksemaInput.value.length);
});