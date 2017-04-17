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
  handleSearch: (e) ->
    e.preventDefault()
    searchValue = ReactDOM.findDOMNode(@refs.search).value
    @searchForIpAddresses search: searchValue
    console.log 'handleSearch'
  searchForIpAddresses: (data) ->
    console.log 'searchForIpAddresses'
    $.ajax
      url: '/api/v1/ip_addresses'
      type: 'GET'
      data: data
      dataType: 'JSON'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log 'ip_addresses AJAX Error: ' + errorThrown
      success: (response) =>
        @setState { ip_addresses: response.ip_addresses }
  componentDidMount: ->
    @searchForIpAddresses()
  render: ->
    RD.div
      className: 'ip-ddresses'
      RD.h1
        className: 'title'
        'IP Addreses'
      RD.div
        className: 'row'
        RD.div
          className: 'col-10'
          RD.input
            className: 'form-control form-control-sm'
            ref: 'search'
            placeholder: 'you can search by IP, MAC, name, office, hardware category and model.'
        RD.div
          className: 'col-1'
          RD.button
            className: 'btn btn-outline-primary btn-sm'
            onClick: @handleSearch
            title: 'search...'
            RD.i
              className: 'fa fa-search'
        RD.div
          className: 'col-1'
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
