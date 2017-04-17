@IpAddress = React.createClass
  getInitialState: ->
    edit: false
    errors: []
  handleToggle: (e) ->
    e.preventDefault()
    @setState {edit: !@state.edit, errors: []}
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
      error: (response) =>
        @setState errors: response.responseJSON.errors
  IpAddressRow: ->
    RD.tr null,
      RD.td null, @props.ip_address.ip
      RD.td null, @props.ip_address.name
      RD.td null, @props.ip_address.hardware_category
      RD.td null, @props.ip_address.building
      RD.td null, @props.ip_address.room
      RD.td
        className: 'text-right'
        RD.button
          className: 'btn btn-outline-primary btn-sm'
          onClick: @handleToggle
          title: 'edit'
          RD.i
            className: 'fa fa-pencil'
        RD.button
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleDelete
          title: 'delete'
          RD.i
            className: 'fa fa-trash-o'
  IpAddressForm: ->
    RD.tr null,
      RD.td
        colSpan: 5
        RD.div
          className: 'row'
          RD.div
            className: 'col'
            RD.label
              'ip'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.ip
              ref: 'ip'
            RD.span null,
              @state.errors.ip
          RD.div
            className: 'col'
            RD.label
              'name'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.name
              ref: 'name'
            RD.span null,
              @state.errors.name
          RD.div
            className: 'col'
            RD.label
              'hardware'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.hardware_category
              ref: 'hardware_category'
            RD.span null,
              @state.errors.hardware_category
          RD.div
            className: 'col'
            RD.label
              'building'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.building
              ref: 'building'
            RD.span null,
              @state.errors.building
          RD.div
            className: 'col'
            RD.label
              'room'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.room
              ref: 'room'
            RD.span null,
              @state.errors.room
        RD.div
          className: 'row'
          RD.div
            className: 'col'
            RD.label
              'mac'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.mac
              ref: 'mac'
            RD.span null,
              @state.errors.mac
          RD.div
            className: 'col'
            RD.label
              'model'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.model
              ref: 'model'
            RD.span null,
              @state.errors.model
          RD.div
            className: 'col'
            RD.label
              'serial_number'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.serial_number
              ref: 'serial_number'
            RD.span null,
              @state.errors.serial_number
          RD.div
            className: 'col'
            RD.label
              'user'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.user
              ref: 'user'
            RD.span null,
              @state.errors.user
          RD.div
            className: 'col'
            RD.label
              'password'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              defaultValue: @props.ip_address.password
              ref: 'password'
            RD.span null,
              @state.errors.password
        RD.div
          className: 'row'
          RD.div
            className: 'col'
            RD.label
              'additional info'
            RD.input
              className: 'form-control form-control-sm'
              type: 'text'
              rows: 3
              defaultValue: @props.ip_address.additional_info
              ref: 'additional_info'
            RD.span null,
              @state.errors.additional_info
      RD.td
        className: 'text-right'
        RD.button
          className: 'btn btn-outline-primary btn-sm'
          onClick: @handleEdit
          title: 'update'
          RD.i
            className: 'fa fa-floppy-o'
        RD.button
          className: 'btn btn-outline-danger btn-sm'
          onClick: @handleToggle
          title: 'cancel'
          RD.i
            className: 'fa fa-undo'
  render: ->
    if @state.edit
      @IpAddressForm()
    else
      @IpAddressRow()
