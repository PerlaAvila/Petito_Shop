// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

$(document).ready(function(){

  
  $('.btn-operators').on("click", function(event){
    event.preventDefault();
    id = $(this).data('id');
    operation = $(this).data('operation');
    quantity = parseFloat($('#quantity-' + id).text());
    price = parseFloat($('#price-' + id).val());
    amount = parseFloat($('#amount-' + id).text());
    stock = parseFloat($('#stock-' + id).val());
    total = parseFloat($('#total').text());
    if (operation == "+") {
      addProduct(stock, quantity, price, total, id);
    } else {
      removeProduct(stock, quantity, price, total, id);
    }

  });

  function addProduct(stock, quantity, price, total, id) {
    if ( isNaN(quantity) ) { quantity = 0 }
    if(stock >= 1){
      quantity++;
      $('#stock-' + id).val(stock - 1);
      $('#quantity-' + id).text(quantity); 
      $('#amount-' + id).text(quantity * price);
      $('#total').text(total + price);
    } else {
      alert("Ya no hay productos");
    }
  } 
  function removeProduct(stock, quantity, price, total, id) {
    if ( isNaN(quantity) ) { quantity = 0 }
    if ( quantity == 0 ) { 
      alert("Ya quitaste todos los productos")
    } else {
      quantity--;
      $('#stock-' + id).val(stock + 1);
      $('#quantity-' + id).text(quantity); 
      $('#amount-' + id).text(quantity * price);
      $('#total').html(total - price);
    }
  } 
});
