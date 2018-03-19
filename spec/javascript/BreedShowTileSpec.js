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

  it("renders the dog's information", done => {
    setTimeout(() => {
      expect(wrapper.find('div')).toHaveText(
        "Brussels Griffon", '12-15 years',
        'alert, curious, loyal', 'Seasonal',
        '7-10 inches', '8-10 pounds', '2-3 times a week brushing');
        done();
      }, 0);
    })

    it('renders an img tag', done => {
      setTimeout(() => {
        expect(wrapper.find('img')).toBePresent();
        done();
      }, 0);
    })

    it('should render an img tag with the specific props', () => {
      expect(wrapper.find('img').props()).toEqual({
        src: 'http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12213537/Brussels-Griffith-Care.jpg',
      });
    });
  })
