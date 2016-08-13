var AllTools = React.createClass({
  onUpdate(newTool) {
    this.props.handleEdit(newTool);
  },
  
  render() {
    var tools = this.props.tools.map((tool, index) => {
      return (
        <div key={tool.id}>
          <Tool tool={tool}
                index={++index}
                handleDelete={this.props.handleDelete.bind(null, tool)}
                handleEdit={this.onUpdate}
              />
        </div>
      )
    })

    return (
      <div>
        {tools}
      </div>
    )
  }
})
