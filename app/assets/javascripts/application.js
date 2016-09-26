// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var opts = {
  lines: 17 // The number of lines to draw
, length: 45 // The length of each line
, width: 14 // The line thickness
, radius: 35 // The radius of the inner circle
, scale: 1 // Scales overall size of the spinner
, corners: 1 // Corner roundness (0..1)
, color: '#000' // #rgb or #rrggbb or array of colors
, opacity: 0.25 // Opacity of the lines
, rotate: 0 // The rotation offset
, direction: 1 // 1: clockwise, -1: counterclockwise
, speed: 1 // Rounds per second
, trail: 60 // Afterglow percentage
, fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
, zIndex: 2e9 // The z-index (defaults to 2000000000)
, className: 'spinner' // The CSS class to assign to the spinner
, top: '50%' // Top position relative to parent
, left: '50%' // Left position relative to parent
, shadow: false // Whether to render a shadow
, hwaccel: false // Whether to use hardware acceleration
, position: 'absolute' // Element positioning
};

function objeto(){
    this.dom = '<"toolbar">frtip';
    this.searching = false;
    this.lengthMenu = [[-1], ["Todos"]];
    this.pagingType = "full_numbers";
    this.pageLength= 15;
    this.language = {
      "lengthMenu": "Mostrar _MENU_ registros por página",
      "zeroRecords": "No existen registros",
      "info": "Mostrar página _PAGE_ de _PAGES_",
      "infoEmpty": "No se encontraron registros",
      "infoFiltered": "(Filtrado de _MAX_ totales de registros)",
      "oPaginate": {
        "sFirst": "Primer página",
        "sPrevious": "Anterior",
        "sNext" : "Siguiente",
        "sLast" : "Ultima página"
      }
    };
    this.aoColumns = [];
    //this.order = true;
}

var arregloCarrito = {};

function agragarArticulo(index, id){
  if( typeof(arregloCarrito[id]) == 'undefined' ){
    arregloCarrito[id] = $(".carrito_img").eq(index).data('json');
    localStorage.carrito = JSON.stringify(arregloCarrito);
  }else{
    bootbox.alert("Articulo ya esta en el carrito");
  }
  generarTabla();
}

function generarTabla(){
  var tbody = '';
  var contador = 1;
  var precioTotal = 0;
  for( var i in arregloCarrito){
    tbody+= '<tr>';
      tbody+= '<td>'+contador+'</td>';
      tbody+= '<td>'+arregloCarrito[i].nombre+'</td>';
      tbody+= '<td>'+arregloCarrito[i].precio+'</td>';
      tbody+= '<td><a onclick="quitarDelCarrito('+i+');" class="btn btn-default" href="javascript:void(0)">Cancelar</></td>';
    tbody+= '</tr>';
    contador++;
    precioTotal += arregloCarrito[i].precio;
  }
  $("#tablaCarrito").html(tbody);
  $("#total").html("Total: $"+precioTotal);
}

function cargarCarrito(){
  arregloCarrito = JSON.parse(localStorage.carrito);
  generarTabla();
}

function envioAjax(){
  $.ajax({
    url: "/buys/generar_archivo",
    type: 'POST',
    data: {jsonDatos: JSON.stringify(arregloCarrito)},
    success: function(data){
      console.log(data.status);
      if( data.status == 'OK' ){
        $("#formulario").submit();
      }
    },
    error: function(){
      console.log("Error");
    }
  });
}

function generarFormulario(){
  var host = location.origin;
  var formulario = '';
  var tipo = '';
  if( true ){
    tipo = 'type="hidden"';
  }
  formulario+='<input name="cmd" '+tipo+' value="_cart">';
  formulario+='<input name="upload" '+tipo+' value="1">';
  formulario+='<input name="business" '+tipo+' value="aldebaran@hotmail.com">';
  formulario+='<input name="shopping_url" '+tipo+' value="'+host/*+"/buys"*/+'">';
  formulario+='<input name="currency_code" '+tipo+' value="MXN">';
  formulario+='<input name="return" '+tipo+' value="'+host+'/compras/compra_correcta'+'">';
  //formulario+='<input name="return" '+tipo+' value="http://127.0.0.1/compra_correcta.php">';
  formulario+='<input name="cancel_return" '+tipo+' value="'+location.href+'">';
  formulario+='<input name="notify_url" '+tipo+' value="'+host+'/buys/notificaciones'+'">';
  formulario+='<input name="rm" '+tipo+' value="1">';
  var contador = 0;
  for(var i in arregloCarrito){
    var id = arregloCarrito[i].id;
    var nombre = arregloCarrito[i].nombre;
    var precio = arregloCarrito[i].precio;
    formulario+='<input name="item_number_'+(contador+1)+'" '+tipo+' value="'+id+'">';
    formulario+='<input name="item_name_'+(contador+1)+'" '+tipo+' value="'+nombre+'">';
    formulario+='<input name="amount_'+(contador+1)+'" '+tipo+' value="'+precio+'">';
    //formulario+='<input name="shipping_'+(contador+1)+'" '+tipo+' value="'+(precio*0.04)+'">';
    formulario+='<input name="quantity_'+(contador+1)+'" '+tipo+' value="1">';
    contador++;
  }
  if( contador > 0 ){
    $("#contenedorArticulos").html(formulario);
    setTimeout(function(){
      //$("#formulario").submit();
      envioAjax();
    }, 100);
  } else {
    $("#contenedorArticulos").empty();
    bootbox.alert("No tiene artículos en el carrito.");
  }
}

function quitarDelCarrito(index){
  delete arregloCarrito[index];
  localStorage.carrito = JSON.stringify(arregloCarrito);
  generarTabla();
}

$(document).on("ready page:load", function(){
  //console.log("ready page:load");
  cargarCarrito();
  //var target = document.getElementById('spinjs');
  //var spinner = new Spinner(opts).spin(target);
  //spinner.spin();
  $('#user_profile_fecha_nacimiento').datepicker({
    format: "yyyy-mm-dd",
    language: 'es'
  });
  var configdatatable = new objeto();
  configdatatable.aoColumns = [
    null,
    null,
    null,
    { "asSorting": false }
  ];
  $('#indexarticulos').DataTable(configdatatable);
  
  var configdatatable2 = new objeto();
  configdatatable2.aoColumns = [
    null,
    null,
    { "asSorting": false }
  ];
  $('#indexcategorias').DataTable(configdatatable2);
  
  var configdatatable3 = new objeto();
  configdatatable3.aoColumns = [
    null,
    null,
    { "asSorting": false }
  ];
  $('#indexsubcategorias').DataTable(configdatatable3);
  
  var configdatatable4 = new objeto();
  configdatatable4.aoColumns = [
    null,
    { "asSorting": false }
  ];
  $('#indexroles').DataTable(configdatatable4);
  
  var configdatatable5 = new objeto();
  configdatatable5.aoColumns = [
    null,
    null
  ];
  configdatatable5.pageLength = 10;
  $('#tablaregistroCompras').DataTable(configdatatable5);
  
  $('#subcategories').selectpicker({
    title: "Opciones"
  });
  
  $('#category_id').selectpicker();
  
  $("#item_cover").filestyle({
    icon: false,
    buttonName: "btn-default",
    buttonText: 'Archivo'
  });
});