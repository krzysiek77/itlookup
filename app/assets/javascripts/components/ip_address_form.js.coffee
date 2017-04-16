 @IpAddressForm = React.createClass
  getInitialState: ->
    ip: ''
    name: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.ip && @state.name
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/api/v1/ip_addresses', { ip_address: @state }, (data) =>
      @props.handleNewIpAddress data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'ip'
          className: 'form-control form-control-sm'
          name: 'ip'
          placeholder: 'ip address'
          value: @state.ip
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'name'
          className: 'form-control form-control-sm'
          name: 'name'
          placeholder: 'name'
          value: @state.name
          onChange: @handleValueChange
      React.DOM.div
        className: 'form-group'
        React.DOM.button
          type: 'submit'
          className: 'btn btn-outline-primary btn-sm'
          disabled: !@valid()
          'Create record'
