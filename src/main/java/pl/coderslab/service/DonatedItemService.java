package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.model.DonatedItem;
import pl.coderslab.repository.DonatedItemRepository;

import java.util.List;

@Service
@Transactional
public class DonatedItemService {

    @Autowired
    private DonatedItemRepository donatedItemRepository;

    public List<DonatedItem> findAll() {
        return donatedItemRepository.findAll();
    }

    public DonatedItem findById(Long id) {
        return donatedItemRepository.findOne(id);
    }
}
