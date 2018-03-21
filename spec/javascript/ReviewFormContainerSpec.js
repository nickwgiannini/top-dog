import ReviewFormContainer from '../../app/javascript/containers/ReviewFormContainer';
import TrainabilityField from '../../app/javascript/components/TrainabilityField';
import DogFriendlyField from '../../app/javascript/components/DogFriendlyField';
import EnergyLevelField from '../../app/javascript/components/EnergyLevelField';
import KidFriendlyField from '../../app/javascript/components/KidFriendlyField';
import BarkingLevelField from '../../app/javascript/components/BarkingLevelField';
import BodyField from '../../app/javascript/components/BodyField';


describe('ReviewFormContainer', () => {
  let wrapper;
  beforeEach(() => {
    wrapper= mount(
      <ReviewFormContainer
      />);
    });

    it('should render header tag', () => {
      expect(wrapper.find('h1')).toBePresent();
    });

    it('should render a form', () => {
      expect(wrapper.find('form')).toBePresent();
    });

    it('should render a TrainabilityField', () => {
      expect(wrapper.find(TrainabilityField)).toBePresent();
    });

    it('should render a BodyField', () => {
      expect(wrapper.find(BodyField)).toBePresent();
    });

    it('should render a KidFriendlyField', () => {
      expect(wrapper.find(KidFriendlyField)).toBePresent();
    });

    it('should render a DogFriendlyField', () => {
      expect(wrapper.find(DogFriendlyField)).toBePresent();
    });

    it('should render a BarkingLevelField', () => {
      expect(wrapper.find(BarkingLevelField)).toBePresent();
    });

    it('should render a EnergLevelField', () => {
      expect(wrapper.find(EnergyLevelField)).toBePresent();
    });
  })
