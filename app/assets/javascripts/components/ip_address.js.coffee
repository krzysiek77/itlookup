@IpAddress = React.createClass
  handleDelete: (e) ->
    e.preventDefault
    $.ajax
      method: 'DELETE'
      url: "/api/v1/ip_addresses/#{ @props.ip_address.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteIpAddress @props.ip_address
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.ip_address.ip
      React.DOM.td null, @props.ip_address.name
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleDelete
          'delete'
