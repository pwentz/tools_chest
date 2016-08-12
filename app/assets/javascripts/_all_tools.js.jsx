var AllTools = React.createClass({
  render() {
    var tools = this.props.tools.map((tool, index) => {
      return (
        <div key={tool.id}>
          <h4>{++index}: {tool.name}</h4>
          <p><strong>Price:</strong> {tool.price}</p>
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
