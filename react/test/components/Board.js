import Board from '../../src/components/Board';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('Board', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(
      <Board
      />
    );
  });

  it('should return true', () => {
    expect(true).toEqual(true);
  });

  it('should render eight Rows', () => {
    expect(wrapper.find('Row').length).toEqual(8);
  });
});
