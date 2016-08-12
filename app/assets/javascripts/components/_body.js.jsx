var Body = React.createClass({
  getInitialState() {
    return { tools: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/admin/tools', (response) => { this.setState({ tools: response }) })
  },

  handleSubmit(tool) {
    var newTools = this.state.tools.concat(tool);
    this.setState({ tools: newTools })
  },

  render() {
    return (
      <div>
        <NewTool handleSubmit={this.handleSubmit} />
        <AllTools tools={this.state.tools} />
      </div>
    )
  }
})
