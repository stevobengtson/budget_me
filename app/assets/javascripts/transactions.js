// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function(Transactions, $, undefined ) {
  //Public Method
  Transactions.showAddRow = function() {
    $('#new_transaction')[0].reset();
    $('.edit-transaction-row[data-transactionid="0"]').show();
  };

  Transactions.showEditRow = function(transactionid) {
    $('#transaction_row_' + transactionid).hide();
    $('#edit_transaction_' + transactionid)[0].reset();
    $('.edit-transaction-row[data-transactionid="' + transactionid + '"]').show();    
  };

  Transactions.hideAddRow = function() {
    $('.edit-transaction-row[data-transactionid="0"]').hide();
  };

  Transactions.hideEditRow = function(transactionid) {
    $('.edit-transaction-row[data-transactionid="' + transactionid + '"]').hide();
    $('#transaction_row_' + transactionid).show();
  };

  Transactions.init = function() {
    $('#transaction_occurred_at').datetimepicker({
      format: 'dddd, MMMM Do YYYY', // Sunday, February 5th 2017
      defaultDate: moment().format('MM/DD/YYYY')
    });

    $('a.edit-transaction-row-button').on('click', function(event) {
      event.preventDefault();
      var transactionid = $(this).data('transactionid');
      if (transactionid > 0) {
        Transactions.showEditRow(transactionid);
      } else {
        Transactions.showAddRow();
      }
    });

    $('.edit-transaction-row-close').on('click', function(event) {
      event.preventDefault();
      var transactionid = $(this).data('transactionid');
      if (transactionid > 0) {
        Transactions.hideEditRow(transactionid);
      } else {
        Transactions.hideAddRow();
      }
    });
  };
}( window.Transactions = window.Transactions || {}, jQuery ));

