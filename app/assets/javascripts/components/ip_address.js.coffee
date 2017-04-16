@IpAddress = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault
    $.ajax
      method: 'DELETE'
      url: "/api/v1/ip_addresses/#{ @props.ip_address.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteIpAddress @props.ip_address
  handleEdit: (e) ->
    e.preventDefault
    data =
      ip: ReactDOM.findDOMNode(@refs.ip).value
      name: ReactDOM.findDOMNode(@refs.name).value
    $.ajax
      method: 'PUT'
      url: "/api/v1/ip_addresses/#{ @props.ip_address.id }"
      dataType: 'JSON'
      data:
        ip_address: data
      success: (data) =>
        @setState edit: false
        @props.handleEditIpAddress @props.ip_address, data
  IpAddressRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.ip_address.ip
      React.DOM.td null, @props.ip_address.name
      React.DOM.td null, @props.ip_address.hardware_category
      React.DOM.td null, @props.ip_address.building
      React.DOM.td null, @props.ip_address.room
      React.DOM.td
        className: 'text-right'
        React.DOM.button
          className: 'btn btn-outline-primary btn-sm'
          onClick: @handleToggle
          'edit'
        React.DOM.button
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleDelete
          'delete'
  IpAddressForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.ip_address.ip
          ref: 'ip'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.ip_address.name
          ref: 'name'
      React.DOM.td null,
        React.DOM.button
          className: 'btn btn-outline-primary btn-sm'
          onClick: @handleEdit
          'update'
        React.DOM.button
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleToggle
          'cancel'
  render: ->
    if @state.edit
      @IpAddressForm()
    else
      @IpAddressRow()
