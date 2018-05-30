import React from 'react';

import GiphysIndex from './giphys_index';


export default class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.props = props;
    this.state = {
      search: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);

  }

  handleChange(e){
    e.preventDefault();
    this.setState({
      search: e.target.value
    });
  }

  handleSubmit(e){
    e.preventDefault();
    let searchTerm = this.state.search.split(' ').join('+');
    this.props.fetchGiphys(searchTerm);
    this.setState({
      search: ''
    });
  }

  render(){
    const {search} = this.state;
    return(
      <div>
        <form className="search-bar" onSubmit={this.handleSubmit}>
          <input value={search} onChange={this.handleChange} placeholder="Search for a gif!"/>
          <input type="submit" value="Search Giphy"/>
        </form>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }


}
