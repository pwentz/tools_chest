var Tool = React.createClass({
  getInitialState() {
    return { editable: false }
  },

  handleEdit() {
    if (this.state.editable) {
      var name = this.refs.name.value;
      var price = this.refs.price.value;
      var newTool = { name: name, price: price, id: this.props.tool.id };

      this.props.handleEdit(newTool);
    }
    this.setState({ editable: !this.state.editable })
  },

  render() {
    var name = this.state.editable ? <input type='text'
                                            ref='name'
                                            defaultValue={this.props.tool.name} />
                                   : <h4>{this.props.index}: {this.props.tool.name}</h4>

    var price = this.state.editable ? <input type='text'
                                            ref='price'
                                            defaultValue={this.props.tool.price} />
                                   : <p><strong>Price:</strong> {this.props.tool.price}</p>
    var editButton = this.state.editable ? 'Save Changes'
                                         : 'Edit Tool'
    return (
      <div>
        { name }
        { price }
        <button onClick={this.handleEdit}>{ editButton }</button>
        <button onClick={this.props.handleDelete}>Delete Tool</button>
      </div>
    )
  }
})
