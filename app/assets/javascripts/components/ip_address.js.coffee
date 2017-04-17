@IpAddress = React.createClass
  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit
  handleDelete: (e) ->
    e.preventDefault
    if confirm 'Are you sure?'
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
      building: ReactDOM.findDOMNode(@refs.building).value
      room: ReactDOM.findDOMNode(@refs.room).value
      mac: ReactDOM.findDOMNode(@refs.mac).value
      hardware_category: ReactDOM.findDOMNode(@refs.hardware_category).value
      model: ReactDOM.findDOMNode(@refs.model).value
      serial_number: ReactDOM.findDOMNode(@refs.serial_number).value
      user: ReactDOM.findDOMNode(@refs.user).value
      password: ReactDOM.findDOMNode(@refs.password).value
      additional_info: ReactDOM.findDOMNode(@refs.additional_info).value
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
          title: 'edit'
          React.DOM.i
            className: 'fa fa-pencil'
        React.DOM.button
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleDelete
          title: 'delete'
          React.DOM.i
            className: 'fa fa-trash-o'
  IpAddressForm: ->
    React.DOM.tr null,
      React.DOM.td
        colSpan: 5
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'ip'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.ip
              ref: 'ip'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'name'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.name
              ref: 'name'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'hardware'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.hardware_category
              ref: 'hardware_category'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'building'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.building
              ref: 'building'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'room'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.room
              ref: 'room'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'mac'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.mac
              ref: 'mac'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'model'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.model
              ref: 'model'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'serial_number'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.serial_number
              ref: 'serial_number'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'user'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.user
              ref: 'user'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'password'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              defaultValue: @props.ip_address.password
              ref: 'password'
        React.DOM.div
          className: 'row'
          React.DOM.div
            className: 'col'
            React.DOM.label
              'additional info'
            React.DOM.input
              className: 'form-control'
              type: 'text'
              rows: 3
              defaultValue: @props.ip_address.additional_info
              ref: 'additional_info'
      React.DOM.td
        className: 'text-right'
        React.DOM.button
          className: 'btn btn-outline-primary btn-sm'
          onClick: @handleEdit
          title: 'update'
          React.DOM.i
            className: 'fa fa-floppy-o'
        React.DOM.button
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleToggle
          title: 'cancel'
          React.DOM.i
            className: 'fa fa-undo'
  render: ->
    if @state.edit
      @IpAddressForm()
    else
      @IpAddressRow()
