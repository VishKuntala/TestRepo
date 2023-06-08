import { BehaviorSubject } from 'rxjs';

// maintain a singleton instance
let pubSubInstance = null;

class PubSub {
  
  #observables = {};
  
  constructor() {
    if (!pubSubInstance) { pubSubInstance = this; }
    return pubSubInstance;
  }

  addObservable(key) {
    if (!this.#observables[key]){
        this.#observables[key] = new BehaviorSubject([]);
    }
  }

  get observables() {
    return this.#observables;
  }

  // do not allow direct modification of observables
  set observables(value) {
    return false;
  }

  publish(currentState, nextState, prop) {
    const currentValue = currentState[prop];
    const nextValue = nextState[prop];
    this.#observables[prop].next(nextValue);
    
  }

  subscribe(callback, prop) {
    if (!this.#observables[prop]){
        this.#observables[prop] = new BehaviorSubject([]);
    }
    this.#observables[prop].subscribe(callback);
    return true;
  }


}

export default PubSub;