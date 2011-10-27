$(function() {
  var formats = $('meta[name=alt_formats]').attr('content');

  if (formats != undefined) {
    $('#formats').append('Alternate Formats ');
    $(formats.split('|')).each(function(index, element) {
      $('#formats').append('[ ');

      $('<a />', {
        href: $(location).attr('pathname').replace('.html','.'+element),
        text: element,
      }).appendTo('#formats');

      $('#formats').append(' ]');
    });
  }
});
