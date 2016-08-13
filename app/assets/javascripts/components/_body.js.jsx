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

  handleDelete(tool) {
    var newTools = this.state.tools.filter((t) => {
      return t.id !== tool.id 
    });

    $.ajax({
      url: `/api/v1/admin/tools/${tool.id}`,
      type: 'DELETE',
      success: () => {
        console.log(`Successfully deleted ${tool.name}`);
      }
    });

    this.setState({ tools: newTools });
  },

  onUpdate(newTool) {
    $.ajax({
      url: `/api/v1/admin/tools/${newTool.id}`,
      type: 'PUT',
      data: { tool: newTool },
      success: () => {
        console.log(`Successfully updated ${newTool.name}`)
        this.swapTools(newTool);
      }
    });
  },

  swapTools(newTool) {
    var newTools = this.state.tools.map((t) => {
      if (t.id === newTool.id) {
        return newTool;
      }
      else {
        return t;
      }
    })

    this.setState({ tools: newTools });
  },

  render() {
    return (
      <div>
        <NewTool handleSubmit={this.handleSubmit}  />
        <AllTools tools={this.state.tools} handleDelete={this.handleDelete} handleEdit={this.onUpdate} />
      </div>
    )
  }
})
