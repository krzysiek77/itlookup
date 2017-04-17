@IpAddresses = React.createClass
  getInitialState: ->
    ip_addresses: []
  getDefaultState: ->
    ip_addresses: []
  addIpAddress: (ip_address) ->
    ip_addresses = @state.ip_addresses.slice()
    ip_addresses.push ip_address
    ip_addresses = ip_addresses.sort((a, b) ->
      if (a.ip < b.ip)
        return -1
      if (a.ip > b.ip)
        return 1
      return 0)
    @setState ip_addresses: ip_addresses
  deleteIpAddress: (ip_address) ->
    ip_addresses = @state.ip_addresses.slice()
    index = ip_addresses.indexOf ip_address
    ip_addresses.splice index, 1
    @replaceState ip_addresses: ip_addresses
  updateIpAddress: (ip_address, data) ->
    index = @state.ip_addresses.indexOf ip_address
    ip_addresses = React.addons.update(@state.ip_addresses, { $splice: [[index, 1, data]] })
    @replaceState ip_addresses: ip_addresses
  componentDidMount: ->
    $.ajax
      url: '/api/v1/ip_addresses'
      type: 'GET'
      dataType: 'JSON'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'ip_addresses AJAX Error: ' + errorThrown
      success: (response) =>
        @setState { ip_addresses: response.ip_addresses }
  render: ->
    RD.div
      className: 'ip-ddresses'
      RD.h1
        className: 'title'
        'IP Addreses'
      React.createElement IpAddressForm, handleNewIpAddress: @addIpAddress
      RD.table
        className: 'table table-stripped table-hover table-sm'
        RD.thead
          className: 'thead-inverse'
          RD.tr null,
            RD.th null, 'ip'
            RD.th null, 'name'
            RD.th null, 'hardware type'
            RD.th null, 'building'
            RD.th null, 'room'
            RD.th
              className: 'text-right'
              'actions'
        RD.tbody null,
          for ip_address in @state.ip_addresses
            React.createElement IpAddress, key: ip_address.id, ip_address: ip_address, handleDeleteIpAddress: @deleteIpAddress, handleEditIpAddress: @updateIpAddress
