var breadcrumb_map = {
  sph : {
    path: '/',
    title: 'UM SPH Home',
  },

  biostat : {
    path: '/biostat/',
    title: 'Department of Biostatistics',
  },

  computing : {
    path: '/biostat/computing/',
    title: 'Biostatistics Computing Resources'
  },

  cluster : {
    path: '/biostat/compute/cluster/',
    title: 'Biostatistics Cluster Documentation',
  },

  compute_servers : {
    path: '/biostat/computing/compute_servers',
    title: 'Compute Servers',
  }
};

$(function() {
  var crumbs = $('meta[name=breadcrumb]').attr('content').split('|');

  if (crumbs.length >= 0) {
    $(crumbs).each(function(index, element) {
        $('<a />', {
          href:  breadcrumb_map[element].path, 
          title: breadcrumb_map[element].title, 
          text:  breadcrumb_map[element].title,
          class: 'breadcrumbs'
        }).appendTo('td.breadcrumb'); 

        $('td.breadcrumb').append(' &gt; ');
    });

    $('td.breadcrumb').append($('<span />', { text: $('title').text() }));
  }
});
