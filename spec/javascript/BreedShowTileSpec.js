import BreedShowTile from '../../app/javascript/components/BreedIndexTile';

describe('BreedShowTile', () => {
  let id,
  name,
  life_expectancy,
  personality,
  shedding,
  height,
  weight,
  grooming,
  img_url,
  wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <BreedShowTile
        id = '1'
        name = 'Brussels Griffon'
        life_expectancy ='12-15 years'
        personality ='alert, curious, loyal'
        shedding ='Seasonal'
        height ='7-10 inches'
        weight ='8-10 pounds'
        grooming ='2-3 times a week brushing'
        img_url ='http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213537/Brussels-Griffith-Care.jpg'
      />
    );
  });

  it('renders a div tag', done => {
    setTimeout(() => {
      expect(wrapper.find('div')).toBePresent();
      done();
    }, 0);
  })
})
