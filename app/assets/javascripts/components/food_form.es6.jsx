class FoodForm extends React.Component {
  constructor (props) {
    super(props);
    this.state = { name: "", unit: "", errors: [] }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInputChange = this.handleInputChange.bind(this);
    this.renderErrors = this.renderErrors.bind(this);
  }

  handleSubmit (event) {
    event.preventDefault();
    var me = this;
    var authenticity_token = $('meta[name="csrf-token"]').attr('content');
    $.post(this.props.url,
      { authenticity_token: authenticity_token, food: { name: this.state.name, unit: this.state.unit } },
    ).done(function(data) {
      me.props.reloadOptionsAndSelect(data.id)
    }).fail(function(data) {
      me.setState({ errors: data.responseJSON["errorMessages"] });
    });
  }

  handleInputChange (event) {
    const name = event.target.name;
    this.setState({ [name]: event.target.value });
  }

  render () {
    return (
      <form className="form" action="/foods" acceptCharset="UTF-8" method="post" onSubmit={ this.handleSubmit }>
        { this.renderErrors() }
        <div className="form-group">
          <label htmlFor="food_name">Name</label>
          <input className="form-control" type="text" name="name" value={ this.state.name } onChange={ this.handleInputChange } />
        </div>
        <div className="form-group">
          <label htmlFor="food_unit">Unit</label>
          <input className="form-control" type="text" name="unit" value={ this.state.unit } onChange={ this.handleInputChange } />
        </div>
        <div className="row">
          <div className="col-xs-12">
            <input type="submit" name="commit" value="Create Food" className="btn btn-success" data-disable-with="Create Food" />
          </div>
        </div>
      </form>
    );
  }

  renderErrors () {
    if (this.state.errors.length > 0) {
      errorList = this.state.errors.map((error, index) =>
          <li key={ index }>{ error }</li>
      );
      return (
        <ul className="alert alert-danger list-unstyled">
          { errorList }
        </ul>
      );
    }
  }
}

