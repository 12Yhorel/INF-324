document.getElementById('cuenta-corriente').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('resultado').innerHTML = 'Has seleccionado la Cuenta Corriente.';
});

document.getElementById('cuenta-ahorros').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('resultado').innerHTML = 'Has seleccionado la Cuenta de Ahorros.';
});

document.getElementById('cuenta-premium').addEventListener('click', function(event) {
    event.preventDefault();
    document.getElementById('resultado').innerHTML = 'Has seleccionado la Cuenta Premium.';
});
