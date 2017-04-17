 @IpAddressForm = React.createClass
  getInitialState: ->
    ip: ''
    name: ''
    building: ''
    room: ''
    mac: ''
    hardware_category: ''
    model: ''
    serial_number: ''
    user: ''
    password: ''
    additional_info: ''
    newRecord: false
    errors: []
  handleToggle: (e) ->
    e.preventDefault()
    # confirm before cancel in case some data has been already provided
    if !@state.newRecord || (@state.newRecord && confirm 'Are you sure?')
      newRecordValue = @state.newRecord
      @setState @getInitialState()
      @setState newRecord: !newRecordValue
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    true
    # @state.ip && @state.name && @state.building && @state.room && @state.hardware_category && @state.model
  handleSubmit: (e) ->
    e.preventDefault()
    $.ajax
      url: 'api/v1/ip_addresses'
      type: 'POST'
      data:
        ip_address: @state
      success: (data) =>
        @props.handleNewIpAddress data
        @setState @getInitialState()
      error: (response) =>
        @setState errors: response.responseJSON.errors
      dataType: 'json'
    # $.post '/api/v1/ip_addresses', { ip_address: @state }, (data) =>
    #   @props.handleNewIpAddress data
    #   @setState @getInitialState()
    # , 'JSON'
  newIpAddressFormAddButton: ->
    RD.div null,
      RD.div
        className: 'row'
        RD.div
          className: 'col text-right'
          RD.button
            className: 'btn btn-outline-primary btn-sm'
            onClick: @handleToggle
            title: 'new IP address'
            RD.i
              className: 'fa fa-plus'
      RD.br null
  newIpAddressForm: ->
    RD.form
      onSubmit: @handleSubmit
      RD.div
        className: 'row'
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'ip'
              className: 'form-control form-control-sm'
              name: 'ip'
              placeholder: 'ip address'
              value: @state.ip
              onChange: @handleValueChange
            RD.span null,
              @state.errors.ip
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'name'
              className: 'form-control form-control-sm'
              name: 'name'
              placeholder: 'name'
              value: @state.name
              onChange: @handleValueChange
            RD.span null,
              @state.errors.name
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'building'
              className: 'form-control form-control-sm'
              name: 'building'
              placeholder: 'building'
              value: @state.building
              onChange: @handleValueChange
            RD.span null,
              @state.errors.building
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'room'
              className: 'form-control form-control-sm'
              name: 'room'
              placeholder: 'room'
              value: @state.room
              onChange: @handleValueChange
            RD.span null,
              @state.errors.room
      RD.div
        className: 'row'
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'mac'
              className: 'form-control form-control-sm'
              name: 'mac'
              placeholder: 'mac'
              value: @state.mac
              onChange: @handleValueChange
            RD.span null,
              @state.errors.mac
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'hardware_category'
              className: 'form-control form-control-sm'
              name: 'hardware_category'
              placeholder: 'hardware_category'
              value: @state.hardware_category
              onChange: @handleValueChange
            RD.span null,
              @state.errors.hardware_category
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'model'
              className: 'form-control form-control-sm'
              name: 'model'
              placeholder: 'model'
              value: @state.model
              onChange: @handleValueChange
            RD.span null,
              @state.errors.model
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'serial_number'
              className: 'form-control form-control-sm'
              name: 'serial_number'
              placeholder: 'serial_number'
              value: @state.serial_number
              onChange: @handleValueChange
            RD.span null,
              @state.errors.serial_number
      RD.div
        className: 'row'
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'user'
              className: 'form-control form-control-sm'
              name: 'user'
              placeholder: 'user'
              value: @state.user
              onChange: @handleValueChange
            RD.span null,
              @state.errors.user
        RD.div
          className: 'col'
          RD.div
            className: 'form-group'
            RD.input
              type: 'password'
              className: 'form-control form-control-sm'
              name: 'password'
              placeholder: 'password'
              value: @state.password
              onChange: @handleValueChange
            RD.span null,
              @state.errors.password
      RD.div
        className: 'row'
        RD.div
          className: 'col-9'
          RD.div
            className: 'form-group'
            RD.textarea
              type: 'additional_info'
              className: 'form-control form-control-sm'
              rows: 3
              name: 'additional_info'
              placeholder: 'additional_info'
              value: @state.additional_info
              onChange: @handleValueChange
            RD.span null,
              @state.errors.additional_info
        RD.div
          className: 'col-3 text-right'
          RD.div
            className: 'form-group'
            RD.button
              type: 'submit'
              className: 'btn btn-outline-primary btn-sm'
              disabled: !@valid()
              title: 'create record'
              RD.i
                className: 'fa fa-floppy-o'
            RD.button
              className: 'btn btn-outline-primary btn-sm'
              onClick: @handleToggle
              title: 'cancel'
              RD.i
                className: 'fa fa-undo'
  render: ->
    if @state.newRecord
      @newIpAddressForm()
    else
      @newIpAddressFormAddButton()
