var NewTool = React.createClass({
  handleClick() {
    var name = this.refs.name.value;
    var price = this.refs.price.value;

    $.ajax({
      url: '/api/v1/admin/tools',
      type: 'POST',
      data: { tool: { name: name, price: price }},
      success: (tool) => {
        this.props.handleSubmit(tool);
      }
    });
  },

  render() {
    return (
      <div>
        <input type='text' ref='name' placeholder='Tool name' />
        <input type='text' ref='price' placeholder='Tool price' />
        <button onClick={this.handleClick}>Submit</button>
      </div>
    )
  }
})
