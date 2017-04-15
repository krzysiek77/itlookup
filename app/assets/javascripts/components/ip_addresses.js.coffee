@IpAddresses = React.createClass
  getInitialState: ->
    ip_addresses: []
  getDefaultState: ->
    ip_addresses: []
  componentDidMount: ->
    console.log 'IpAddresses component did mount'
    $.ajax
      url: '/api/v1/ip_addresses'
      type: 'GET'
      dataType: 'JSON'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'ip_addresses AJAX Error: ' + errorThrown
      success: (response) =>
        console.log 'response:', response
        @setState { ip_addresses: response.ip_addresses }
        console.log @state.ip_addresses
        console.log @state.ip_addresses.length
  render: ->
    React.DOM.div
      className: 'ip-ddresses'
      React.DOM.h1
        className: 'title'
        'IP Addreses'
      React.DOM.table
        className: 'table table-responsive table-stripped table-hover table-sm'
        React.DOM.thead
          className: 'thead-inverse'
          React.DOM.tr null,
            React.DOM.th null, 'ip'
            React.DOM.th null, 'name'
        React.DOM.tbody null,
          for ip_address in @state.ip_addresses
            React.createElement IpAddress, key: ip_address.id, ip_address: ip_address
