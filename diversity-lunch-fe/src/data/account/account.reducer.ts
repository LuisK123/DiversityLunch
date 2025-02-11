import { Reducer } from 'redux';
import { AccountState } from './account-state.type';
import { AccountStateAction } from './account-state-action.type';

const initialState: AccountState = {
    status: 'PENDING',
};

export const accountReducer: Reducer<AccountState, AccountStateAction> = (
    // eslint-disable-next-line default-param-last
    state: AccountState = initialState,
    action: AccountStateAction,
): AccountState => {
    switch (action.type) {
        case 'ACCOUNT_PENDING': {
            return {
                status: 'PENDING',
            };
        }
        case 'ACCOUNT_ERROR': {
            return {
                status: 'ERROR',
            };
        }
        case 'ACCOUNT_LOADING': {
            return {
                status: 'LOADING',
            };
        }
        case 'ACCOUNT_LOADING_SUCCEEDED': {
            return {
                status: 'OK',
                accountData: action.payload,
            };
        }
        default: {
            return state;
        }
    }
};
