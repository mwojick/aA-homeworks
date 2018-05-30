import { connect } from 'react-redux';
import GiphysSearch from './giphys_search';
import { fetchGiphys } from '../actions/giphy_actions';

const mapStateToProps = (state) => ({
  giphys: state.giphys
});

const mapDispatchToProps = (dispatch) => ({
  fetchGiphys: searchTerm => dispatch(fetchGiphys(searchTerm))
});


export default connect(mapStateToProps, mapDispatchToProps)(GiphysSearch);
