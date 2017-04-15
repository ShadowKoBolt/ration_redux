class FoodSelect extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      foods: props.foods,
      selectedFoodId: props.selectedFoodId
    };
    this.handleChange = this.handleChange.bind(this);
    this.reloadOptionsAndSelect = this.reloadOptionsAndSelect.bind(this);
  }

  handleChange (event) {
    this.setState({ selectedFoodId: event.target.value});
  }

  reloadOptionsAndSelect(value) {
    var me = this;
    $.get(this.props.url, function(data) {
      me.setState({ foods: data, selectedFoodId: value });
    });
  }

  render () {
    return (
      <div>
        <div className="form-group">
          <label htmlFor="ingredient_food_id">Food</label>
          <select value={ this.state.selectedFoodId } className="form-control" name="ingredient[food_id]" onChange={ this.handleChange }>
            <option value="" disabled>Select a food</option>
            <option value="add">Add new food</option>
            { this.renderOptions() }
          </select>
        </div>
        { this.renderForm() }
      </div>
    );
  }

  renderOptions () {
    return this.state.foods.map((food) =>
      <option key={food.id} value={food.id}>{food.name} ({food.unit})</option>
    );
  }

  renderForm () {
    if (this.state.selectedFoodId === "add") {
      return (
          <div className="well">
            <FoodForm valueMethod="id" url={ this.props.url } reloadOptionsAndSelect={ this.reloadOptionsAndSelect } />
          </div>
      );
    }
  }
}

