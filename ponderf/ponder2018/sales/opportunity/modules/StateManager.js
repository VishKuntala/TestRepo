import * as R from 'ramda';
import PubSub from './PubSub.js';

// maintain a singleton instance
let storeInstance = null;

class StateManager {

    #internalState = {};
    #pubsub
    #store
    #appState = {
        publish: true
    };

    constructor() {
        if (!storeInstance) { storeInstance = this; }
        this.#pubsub = new PubSub();
        this.#store = new Proxy(this.#internalState, {
            set: (obj, prop, value) => {
                const currentState = R.clone(this.#internalState);
                obj[prop] = value;
                const nextState = R.clone(this.#internalState);
                this.#pubsub.addObservable(prop);
                if (this.#appState.publish) {
                    this.#pubsub.publish(currentState, nextState, prop);
                }
                return nextState;
            },
            get: (target, prop, receiver) => R.clone(target[prop])
        });
        return storeInstance;
    }

    get store() {
        return this.#store;
    }

    get appState() {
        return this.#appState;
    }


    subscribe(prop, callback) {
        return this.#pubsub.subscribe(callback, prop)
    }

    unsubscribeAll() {
        this.#pubsub.unsubscribeAll();
    }

}

export default StateManager;