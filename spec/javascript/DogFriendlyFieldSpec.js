import DogFriendlyField from '../../app/javascript/components/DogFriendlyField';

describe('DogFriendlyField', () => {
  let label,
  content,
  onChange,
  wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    onChange = jasmine.createSpy('onChange spy')
    wrapper = mount(
      <DogFriendlyField
        label = "Default Label"
        content= '1'
        onChange= {onChange}
      />
    )
  });

  it('should render a label', () => {
    expect(wrapper.find('label')).toBePresent();
  });

  it('should render a label that says Barking Level', () => {
    expect(wrapper.find('label')).toIncludeText("Default Label");
  });

  it('should render a label with a default value of 1', () => {
    expect(wrapper.find('label')).toIncludeText("1");
  });
})
