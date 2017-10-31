import Row from '../../src/components/Row';
import React from 'react';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';

describe('Row', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(
      <Row
      />
    );
  });

  it('should return true', () => {
    expect(true).toEqual(true);
  });

  it('should render eight Squares', () => {
    expect(wrapper.find('Square').length).toEqual(8);
  });
});
