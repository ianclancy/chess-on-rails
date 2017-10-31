import SideBar from "../../src/components/SideBar";
import React from "react";
import { mount } from "enzyme";
import jasmineEnzyme from "jasmine-enzyme";

describe("SideBar", () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(
      <SideBar
      />
    );
  });

  it("should return true", () => {
    expect(true).toEqual(true);
  });

  it("should render a single 'h1' component", () => {
    expect(wrapper.find("h1").length).toEqual(1);
  });

  it("should render a single 'Link' component", () => {
    expect(wrapper.find("Link").length).toEqual(1);
  });
});
