package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Institution;
import pl.coderslab.repository.InstitutionRepository;

import java.util.List;

@Service
@Transactional
public class InstitutionService {

    @Autowired
    private InstitutionRepository institutionRepository;

    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    public Institution findById(Long id) {
        return institutionRepository.findOne(id);
    }

    public void save(Institution entity) {
        institutionRepository.save(entity);
    }

    public void delete(Long id) {
        institutionRepository.delete(id);
    }

}
