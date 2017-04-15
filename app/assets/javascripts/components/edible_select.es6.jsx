class EdibleSelect extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      recipes: props.recipes,
      foods: props.foods,
      selectedFoodId: ""
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
          <label htmlFor="meal_edible_type_and_id">Edible</label>
          <select value={ this.state.selectedFoodId } className="form-control" name="meal[edible_type_and_id]" onChange={ this.handleChange }>
            <option value="" disabled>Select an edible</option>
            <optgroup label="Recipes">
              { this.renderRecipeOptions() }
            </optgroup>
            <optgroup label="Foods">
              <option value="addFood">Add new food</option>
              { this.renderFoodOptions() }
            </optgroup>
          </select>
        </div>
        { this.renderForm() }
      </div>
    );
  }

  renderFoodOptions () {
    return this.state.foods.map((food) =>
      <option key={food.type_and_id} value={food.type_and_id}>{food.name} ({food.unit})</option>
    );
  }

  renderRecipeOptions () {
    return this.state.recipes.map((recipe) =>
      <option key={recipe.type_and_id} value={recipe.type_and_id}>{recipe.name} (serves {recipe.serves})</option>
    );
  }

  renderForm () {
    if (this.state.selectedFoodId === "addFood") {
      return (
          <div className="well">
            <FoodForm valueMethod="type_and_id" url={ this.props.url } reloadOptionsAndSelect={ this.reloadOptionsAndSelect } />
          </div>
      );
    }
  }
}

