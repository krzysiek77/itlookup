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
        console.log "errors: " + @state.errors.ip
        console.log "errors: " + @state.ip
      dataType: 'json'
    # $.post '/api/v1/ip_addresses', { ip_address: @state }, (data) =>
    #   @props.handleNewIpAddress data
    #   @setState @getInitialState()
    # , 'JSON'
  newIpAddressFormAddButton: ->
    React.DOM.div null,
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col text-right'
          React.DOM.button
            className: 'btn btn-outline-primary btn-sm'
            onClick: @handleToggle
            'new IP address'
      React.DOM.br null
  newIpAddressForm: ->
    React.DOM.form
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'ip'
              className: 'form-control form-control-sm'
              name: 'ip'
              placeholder: 'ip address'
              value: @state.ip
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.ip
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'name'
              className: 'form-control form-control-sm'
              name: 'name'
              placeholder: 'name'
              value: @state.name
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.name
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'building'
              className: 'form-control form-control-sm'
              name: 'building'
              placeholder: 'building'
              value: @state.building
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.building
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'room'
              className: 'form-control form-control-sm'
              name: 'room'
              placeholder: 'room'
              value: @state.room
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.room
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'mac'
              className: 'form-control form-control-sm'
              name: 'mac'
              placeholder: 'mac'
              value: @state.mac
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.mac
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'hardware_category'
              className: 'form-control form-control-sm'
              name: 'hardware_category'
              placeholder: 'hardware_category'
              value: @state.hardware_category
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.hardware_category
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'model'
              className: 'form-control form-control-sm'
              name: 'model'
              placeholder: 'model'
              value: @state.model
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.model
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'serial_number'
              className: 'form-control form-control-sm'
              name: 'serial_number'
              placeholder: 'serial_number'
              value: @state.serial_number
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.serial_number
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'user'
              className: 'form-control form-control-sm'
              name: 'user'
              placeholder: 'user'
              value: @state.user
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.user
        React.DOM.div
          className: 'col'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
              type: 'password'
              className: 'form-control form-control-sm'
              name: 'password'
              placeholder: 'password'
              value: @state.password
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.password
      React.DOM.div
        className: 'row'
        React.DOM.div
          className: 'col-9'
          React.DOM.div
            className: 'form-group'
            React.DOM.textarea
              type: 'additional_info'
              className: 'form-control form-control-sm'
              rows: 3
              name: 'additional_info'
              placeholder: 'additional_info'
              value: @state.additional_info
              onChange: @handleValueChange
            React.DOM.span null,
              @state.errors.additional_info
        React.DOM.div
          className: 'col-3 text-right'
          React.DOM.div
            className: 'form-group'
            React.DOM.button
              type: 'submit'
              className: 'btn btn-outline-primary btn-sm'
              disabled: !@valid()
              'create record'
            React.DOM.button
              className: 'btn btn-outline-primary btn-sm'
              onClick: @handleToggle
              'cancel'
  render: ->
    if @state.newRecord
      @newIpAddressForm()
    else
      @newIpAddressFormAddButton()
