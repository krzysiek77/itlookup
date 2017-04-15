@IpAddress = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.ip_address.ip
      React.DOM.td null, @props.ip_address.name
