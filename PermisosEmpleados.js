$('#fecha').datepicker({
    format: 'dddd dd/mm/yyyy',
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    minDate: new Date(2018, 1, 1),
    i18n:{
        months: ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        monthsShort: ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'],
        weekdays:['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'],
        weekdaysShort: ['Dom','Lun','Mar','Mie','Jue','Vie','Sab'],
        weekdaysAbbrev: ['D','L','M','M','J','V','S'],
    }
});
