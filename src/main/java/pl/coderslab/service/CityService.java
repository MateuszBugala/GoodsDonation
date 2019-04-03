package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.City;
import pl.coderslab.repository.CityRepository;

import java.util.List;

@Service
@Transactional
public class CityService {

    @Autowired
    private CityRepository cityRepository;

    public List<City> findAll() {
        return cityRepository.findAll();
    }

    public City findById(Long id) {
        return cityRepository.findOne(id);
    }

    public void save(City entity) {
        cityRepository.save(entity);
    }

    public void delete(Long id) {
        cityRepository.delete(id);
    }

}
