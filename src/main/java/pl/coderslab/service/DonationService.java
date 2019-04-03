package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Donation;
import pl.coderslab.repository.DonationRepository;

import java.util.List;

@Service
@Transactional
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;

    public List<Donation> findAll() {
        return donationRepository.findAll();
    }

    public Donation findById(Long id) {
        return donationRepository.findOne(id);
    }

    public void save(Donation entity) {
        donationRepository.save(entity);
    }

    public void delete(Long id) {
        donationRepository.delete(id);
    }
}
