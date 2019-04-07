package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.Donation;
import pl.coderslab.repository.DonationRepository;

import java.time.LocalDateTime;
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
        entity.setDonated(false);
        entity.setPickedUp(false);
        entity.setCreationTime(LocalDateTime.now());
        donationRepository.save(entity);
    }

    public void update(Donation entity) {
        donationRepository.save(entity);
    }

    public void delete(Long id) {
        donationRepository.delete(id);
    }

    public List<Donation> findAllByUserId( Long id) {
        return donationRepository.findAllByUserId(id);
    }

    public Long donatedBags() {
        return donationRepository.donatedBags();
    }

    public Long donatedInstitutions() {
        return donationRepository.donatedInstitutions();
    }
}
