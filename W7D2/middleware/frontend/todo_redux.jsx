import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// Phase 1: Logging
// const addLoggingToDispatch = (store) => {
//   const dispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     dispatch(action);
//     console.log(store.getState());
//   };
// };

// Phase 2: Refactoring
// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };

//// The actual applyMiddleware iterates in opposite direction.

// const applyMiddlewares = (store, ...midwares) => {
//   let dispatch = store.dispatch;
//   midwares.forEach((mw)=>{
//     dispatch = mw(store)(dispatch);
//   });
//   return Object.assign({}, store, {dispatch});
// };


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // Phase 1:
  // store.dispatch = addLoggingToDispatch(store);

  // Phase 2:
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
